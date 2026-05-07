; mixed program
; initialization
  LDI r12, 1
  LDI r6, 0x1E3EBE
  LDI r10, 2621
  LDI r7, 0x4F5429
  LDI r11, 1337
  LDI r2, 0x48D48D
  LDI r7, 255
  STORE r7, r13
  LOAD r8, r7
  LDI r3, 0x58E132
  STORE r3, r7
  LOAD r1, r3
  LDI r13, 0x85AC68
  STORE r13, r11
  LOAD r7, r13
  LDI r14, 1224
  STORE r14, r1
  LOAD r8, r14
  IKEY r4
  CMPI r4, 0x882A49
  JNZ r4, key_0
  LDI r5, 0xF7CEC8
loop_1:
  ADD r9, r23, r7
  ADDI r6, r3, 0xF463CA
  SUBI r15, r1, 16
  LDI r0, 1
  SUB r5, r5, r0
  JNZ r5, loop_1
  CMPI r8, 0x789F7D
  XOR r15, r17, r6
  OR r9, r14, r20
  PUSH r13
  MUL r7, r8, r15
  ADD r1, r5, r14
  SHL r7, r13, r6
  ADD r8, r5, r0
  POP r13
main_2:
  CMPI r7, r10, 225
  IKEY r5
  CMPI r5, 59
  JNZ r5, key_3
  SHR r8, r24, r12
  SHL r7, r1, r9
  SHL r0, r11, r10
  LDI r2, 0x11EB99
  LDI r2, 0xF095E8
  LDI r9, 3836
  TEXT r2, r2, r9, "HELLO"
  LDI r12, 16
  LDI r5, 577
  LDI r12, 128
  PSET r12, r5, r12
  FRAME
  JMP main_2
