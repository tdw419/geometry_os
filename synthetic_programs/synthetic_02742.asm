; drawing loop program
; initialization
  LDI r11, 2366
  LDI r12, 0x05695B
main_0:
  CMP r14, r6
  IKEY r9
  CMPI r9, 0x621799
  JNZ r9, key_1
  IKEY r2
  CMPI r2, 0
  JNZ r2, key_2
  IKEY r20
  CMPI r20, 0xB02FBB
  JNZ r20, key_3
  SHL r4, r10, r9
  SHR r6, r5, r12
  SHLI r6, r5, 6
  FRAME
  JMP main_0
