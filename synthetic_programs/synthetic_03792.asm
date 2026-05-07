; mixed program
; initialization
  LDI r9, 16
  LDI r11, 2858
  LDI r8, 0xA6C9A4
  LDI r0, 128
  LDI r13, 0xCC8E4A
  LDI r6, 16
  LDI r14, 0
  LDI r5, 0
  CALL func_0
func_0:
  SHL r5, r11, r1
  ADD r10, r7, r4
  RET
  AND r5, r4, r14
  AND r6, r9, r10
  CALL func_1
func_1:
  MUL r13, r12, r11
  ADD r4, r7, r5
  OR r6, r14, r9
  AND r12, r13, r9
  XOR r1, r28, r13
  RET
  IKEY r9
  CMPI r9, 0xA3810A
  JNZ r9, key_2
  AND r5, r1, r6
  XOR r6, r2, r7
  LDI r12, 16
  LDI r5, 3727
  LDI r14, 10
  TEXT r12, r5, r14, "HELLO"
main_3:
  LDI r5, 0xBDEB3A
  LDI r1, 256
  LDI r7, 256
  DRAWTEXT r5, r1, r7, "WORLD"
  CMP r11, r4
  LDI r3, 64
  LDI r7, 0x3815DB
  LDI r0, 3005
  DRAWTEXT r3, r7, r0, "WORLD"
  FRAME
  JMP main_3
