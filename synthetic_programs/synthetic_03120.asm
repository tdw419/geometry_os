; mixed program
; initialization
  LDI r3, 2337
  LDI r4, 0x93A21D
  LDI r7, 128
  LDI r5, 2434
  CALL func_0
func_0:
  SUB r3, r12, r13
  XOR r1, r5, r4
  MOD r9, r11, r5
  MOD r9, r20, r4
  SHR r14, r15, r0
  RET
  LDI r13, 1551
  LDI r2, 2932
  LDI r5, 302
  WPIXEL
  CMP r14, r9
  JZ r14, else_1
  MUL r9, r11, r8
  SHR r7, r6, r10
  JMP endif_2
else_1:
  LDI r28, 2205
  LDI r9, 16
  LDI r8, 0x95C411
  PSET r28, r9, r8
  LDI r4, 3641
  LDI r13, 650
  LDI r14, 0x8C9DCE
  LDI r9, 0x41EDA9
  LDI r16, 1360
  RECTF r4, r13, r14, r9, r16
  LDI r2, 2333
  LDI r0, 8
  LDI r7, 0xBC4297
  WPIXEL
  LDI r5, 32
  LDI r0, 228
  LDI r15, 2484
  PSET r5, r0, r15
endif_2:
  CMP r10, r1
  OR r1, r14, r4
  XOR r1, r0, r14
  AND r11, r12, r5
main_3:
  IKEY r2
  CMPI r2, 0xE4AE57
  JNZ r2, key_4
  LDI r10, 8
  LDI r1, 10
  LDI r3, 0x66FF54
  PSETI
  LDI r0, 10
  LDI r3, 64
  LDI r30, 8
  DRAWTEXT r0, r3, r30, "WORLD"
  FRAME
  JMP main_3
