; input driven program
; initialization
  LDI r12, 0x38A89E
  LDI r3, 2160
  LDI r29, 192
  LDI r7, 3105
  LDI r6, 1068
  LDI r9, 0x0CBBCB
  LDI r0, 0
  LDI r25, 2805
main_0:
  CMP r8, r9
  AND r1, r2, r11
  AND r9, r11, r0
  AND r15, r8, r11
  SHR r0, r9, r3
  SHL r9, r5, r11
  SHLI r11, r7, 0
  SHR r14, r9, r10
  AND r7, r13, r14
  XOR r5, r10, r7
  OR r9, r29, r10
  XOR r11, r12, r2
  FRAME
  JMP main_0
