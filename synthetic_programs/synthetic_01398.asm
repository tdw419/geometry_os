; input driven program
; initialization
  LDI r2, 0x4E869C
  LDI r15, 0x02EBEC
  LDI r10, 1
  LDI r1, 32
  LDI r5, 720
main_0:
  SHL r4, r13, r5
  SHR r3, r14, r1
  SAR r19, r14, r5
  SAR r2, r12, r4
  SHLI r6, r11, 2
  SHLI r14, r12, 4
  SHLI r4, r7, 0xB6E92A
  SAR r3, r11, r8
  FRAME
  JMP main_0
