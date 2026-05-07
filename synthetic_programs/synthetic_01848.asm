; mixed program
; initialization
  LDI r3, 294
  LDI r0, 256
  LDI r9, 0x62F2AE
  LDI r7, 1512
  LDI r5, 0xB53D47
  LDI r4, 2613
  LDI r10, 1976
  LDI r12, 64
  LDI r8, 4
loop_0:
  ANDI r4, r12, 8
  LDI r5, 1
  SUB r8, r8, r5
  JNZ r8, loop_0
  LDI r12, 1246
  LDI r8, 2048
  LDI r17, 255
  TEXT r12, r8, r17, "HELLO"
  LDI r10, 0xB12CFE
  LDI r12, 4
  LDI r0, 256
  DRAWTEXT r10, r12, r0, "WORLD"
  LDI r8, 16
  LDI r0, 0xAF002D
  LDI r13, 32
  TEXT r8, r0, r13, "HELLO"
  LDI r12, 1935
  FILL r12
  LDI r13, 8
  STORE r13, r3
  LOAD r5, r13
  LDI r11, 2
  STORE r11, r9
  LOAD r15, r11
  LDI r3, 0x2E4260
  STORE r3, r3
  LOAD r14, r3
  LDI r15, 2243
  STORE r15, r14
  LOAD r7, r15
main_1:
  ADDI r9, r14, 26
  LDI r11, 0xF3D2EA
  LDI r14, 4
  LDI r15, 2684
  TEXT r11, r14, r15, "HELLO"
  SAR r10, r15, r6
  SHL r2, r9, r6
  IKEY r14
  CMPI r14, 25
  JNZ r14, key_2
  FRAME
  JMP main_1
