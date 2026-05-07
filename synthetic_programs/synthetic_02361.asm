; input driven program
; initialization
  LDI r6, 128
  LDI r10, 873
  LDI r7, 255
main_0:
  LDI r5, 0x469FF9
  LDI r12, 3292
  LDI r13, 0xC77B8B
  DRAWTEXT r5, r12, r13, "WORLD"
  SAR r0, r7, r8
  SHR r13, r8, r6
  SAR r6, r3, r1
  CMP r10, r0
  CMPI r1, 0x4A9E54
  FRAME
  JMP main_0
