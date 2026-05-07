; mixed program
; initialization
  LDI r7, 0x26FBE0
  LDI r2, 3317
  LDI r14, 255
  LDI r11, 256
  LDI r15, 4
  LDI r4, 0xA67821
  SHLI r9, r14, 0xB4230D
  SHLI r9, r12, 2
  SAR r12, r14, r4
  SHR r5, r6, r15
  LDI r4, 1
  STORE r4, r2
  LOAD r8, r4
  LDI r6, 0x6004
  STORE r6, r6
  LOAD r8, r6
  LDI r25, 1449
  STORE r25, r13
  LOAD r9, r25
  IKEY r6
  CMPI r6, 255
  JNZ r6, key_0
  CMP r11, r14
  JNZ r11, else_1
  SUB r0, r22, r10
  MUL r11, r10, r15
  SUB r2, r10, r5
  MUL r11, r12, r15
  JMP endif_2
else_1:
  LDI r1, 0x4A2E57
  FILL r1
endif_2:
  LDI r11, 37
loop_3:
  ADDI r9, r2, 255
  CMPI r15, r7, 4
  LDI r1, 1
  SUB r11, r11, r1
  JNZ r11, loop_3
  LDI r8, 111
  STORE r8, r4
  LOAD r15, r8
  LDI r2, 0xD253B3
  STORE r2, r2
  LOAD r11, r2
  LDI r4, 0xAE5E2F
  STORE r4, r2
  LOAD r14, r4
  CMP r4, r15
main_4:
  IKEY r0
  CMPI r0, 0x0A9D6B
  JNZ r0, key_5
  LDI r1, 1608
  LDI r4, 16
  LDI r13, 0xAF751B
  DRAWTEXT r1, r4, r13, "WORLD"
  ANDI r1, r10, 170
  FRAME
  JMP main_4
