; mixed program
; initialization
  LDI r11, 2156
  LDI r8, 1379
  CMP r11, r12
  JZ r11, else_0
  SHL r2, r5, r11
  MOD r8, r10, r2
  ADD r6, r15, r1
  JMP endif_1
else_0:
  LDI r10, 0x3EEC4C
  LDI r0, 776
  LDI r8, 0x151491
  LDI r10, 0x4455F9
  LDI r28, 0x55BC4A
  LINE r10, r0, r8, r10, r28
endif_1:
  LDI r14, 0xC42B18
  STORE r14, r27
  LOAD r10, r14
  LDI r5, 0x05E2F5
  STORE r5, r8
  LOAD r15, r5
  LDI r4, 991
  STORE r4, r9
  LOAD r1, r4
  LDI r5, 0
  LDI r4, 10
  LDI r2, 0
  TEXT r5, r4, r2, "HELLO"
  LDI r1, 128
loop_2:
  SHL r0, r9, r1
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_2
main_3:
  LDI r1, 0x14FD23
  FILL r1
  SUBI r0, r12, 116
  LDI r6, 32
  LDI r15, 0x141447
  LDI r6, 0x815939
  TEXT r6, r15, r6, "HELLO"
  CMP r0, r14
  IKEY r15
  CMPI r15, 0x149410
  JNZ r15, key_4
  CMPI r10, 16
  FRAME
  JMP main_3
