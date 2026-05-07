; input driven program
; initialization
  LDI r1, 1140
  LDI r12, 16
  LDI r15, 0x91EDA3
  LDI r6, 0x936173
  LDI r8, 2083
main_0:
  IKEY r10
  CMPI r10, 256
  JNZ r10, key_1
  LDI r23, 0x609AF9
  LDI r1, 3071
  LDI r10, 128
  WPIXEL
  OR r5, r0, r14
  AND r5, r26, r8
  AND r2, r20, r4
  AND r15, r14, r2
  SHR r10, r14, r7
  SHL r3, r10, r4
  SAR r14, r13, r15
  SAR r8, r2, r5
  IKEY r12
  CMPI r12, 16
  JNZ r12, key_2
  FRAME
  JMP main_0
