; input driven program
; initialization
  LDI r10, 8
  LDI r1, 256
  LDI r2, 64
  LDI r15, 32
main_0:
  AND r14, r7, r4
  OR r1, r10, r3
  SHL r4, r0, r13
  SHR r16, r4, r0
  SHLI r6, r12, 0x745E4A
  SHLI r15, r11, 0x7F5A54
  FRAME
  JMP main_0
