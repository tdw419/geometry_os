; input driven program
; initialization
  LDI r2, 2963
  LDI r3, 0x678117
  LDI r4, 0xE238EC
  LDI r6, 64
  LDI r1, 3742
  LDI r14, 0
  LDI r0, 371
main_0:
  AND r1, r2, r31
  AND r5, r13, r12
  OR r12, r4, r11
  AND r12, r7, r0
  SHLI r7, r11, 0x608082
  SHL r13, r0, r2
  SHL r14, r1, r7
  IKEY r1
  CMPI r1, 0x941A56
  JNZ r1, key_1
  IKEY r10
  CMPI r10, 164
  JNZ r10, key_2
  IKEY r4
  CMPI r4, 211
  JNZ r4, key_3
  FRAME
  JMP main_0
