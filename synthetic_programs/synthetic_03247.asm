; mixed program
; initialization
  LDI r10, 32
  LDI r8, 2318
  LDI r15, 16
  LDI r14, 0xAFED80
  LDI r11, 0x19CECA
  CMPI r11, 128
  XOR r5, r3, r10
  PUSH r10
  DIV r11, r3, r0
  SHR r14, r0, r6
  ADD r4, r31, r5
  SHL r0, r12, r10
  POP r10
  LDI r13, 0xFD29CF
loop_0:
  SUBI r1, r12, 0x6C0895
  LDI r4, 1
  SUB r13, r13, r4
  JNZ r13, loop_0
main_1:
  LDI r13, 256
  LDI r0, 0xEF7534
  LDI r9, 32
  WPIXEL
  LDI r13, 3627
  LDI r27, 128
  LDI r5, 0x0659EE
  LDI r9, 2176
  CIRCLE r13, r27, r5, r9
  CMP r5, r15
  ADDI r11, r13, 1
  LDI r6, 0x83FA83
  LDI r5, 0
  LDI r3, 0
  LDI r3, 4
  LDI r8, 3147
  LINE r6, r5, r3, r3, r8
  FRAME
  JMP main_1
