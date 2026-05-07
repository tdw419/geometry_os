; mixed program
; initialization
  LDI r15, 16
  LDI r0, 0x613924
  AND r10, r0, r3
  OR r1, r22, r4
  LDI r9, 3129
  LDI r0, 10
  LDI r4, 0x5DFA18
  DRAWTEXT r9, r0, r4, "WORLD"
  SHR r12, r11, r9
  SHL r12, r7, r9
  SHR r30, r2, r14
  SHL r14, r13, r3
  LDI r8, 24
loop_0:
  ANDI r6, r3, 40
  SUB r9, r3, r1
  ADDI r1, r15, 0x1A0B9C
  LDI r3, 1
  SUB r8, r8, r3
  JNZ r8, loop_0
  LDI r9, 128
loop_1:
  LDI r6, 0xA391A5
  FILL r6
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_1
main_2:
  LDI r8, 0x316428
  LDI r4, 2
  LDI r13, 0x1B9000
  PSETI
  LDI r4, 1105
  LDI r12, 3851
  LDI r8, 8
  LDI r9, 8
  LDI r11, 2
  LINE r4, r12, r8, r9, r11
  XOR r15, r0, r8
  OR r9, r12, r13
  XOR r26, r2, r0
  OR r5, r12, r10
  FRAME
  JMP main_2
