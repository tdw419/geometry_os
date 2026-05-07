; input driven program
; initialization
  LDI r13, 0xA377A0
  LDI r6, 256
  LDI r11, 16
  LDI r30, 256
  LDI r4, 128
  LDI r15, 0xD52A83
  LDI r10, 8
  LDI r0, 0x008432
main_0:
  SHL r12, r13, r0
  SHR r2, r9, r0
  LDI r12, 0x00DC04
  LDI r11, 2139
  LDI r7, 10
  PSETI
  IKEY r11
  CMPI r11, 110
  JNZ r11, key_1
  IKEY r6
  CMPI r6, 137
  JNZ r6, key_2
  SHR r10, r7, r14
  FRAME
  JMP main_0
