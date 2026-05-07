; input driven program
; initialization
  LDI r14, 8
  LDI r0, 0xF095B7
  LDI r26, 64
  LDI r11, 255
  LDI r23, 2881
main_0:
  CMPI r17, r7, 0x9D2DCF
  SAR r9, r12, r6
  SHLI r1, r5, 0xA66A32
  MOD r31, r4, r9
  CMPI r10, 196
  SHR r5, r0, r13
  SHR r3, r4, r10
  IKEY r12
  CMPI r12, 51
  JNZ r12, key_1
  FRAME
  JMP main_0
