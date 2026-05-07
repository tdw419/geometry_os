; input driven program
; initialization
  LDI r15, 0xCA34C2
  LDI r9, 0x0521D4
  LDI r6, 1
  LDI r4, 4
  LDI r2, 2521
  LDI r7, 2656
  LDI r8, 0x4B57ED
  LDI r0, 0xB8A47E
main_0:
  CMPI r4, 255
  XOR r18, r11, r15
  SAR r12, r4, r5
  SHR r16, r4, r10
  SHR r1, r14, r7
  AND r3, r12, r8
  OR r0, r9, r5
  FRAME
  JMP main_0
