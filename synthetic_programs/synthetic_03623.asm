; input driven program
; initialization
  LDI r23, 3357
  LDI r2, 0xCD2248
  LDI r4, 3970
  LDI r12, 0xCE8823
main_0:
  LDI r9, 1
  LDI r14, 8
  LDI r13, 1240
  WPIXEL
  LDI r9, 10
  LDI r24, 1979
  LDI r1, 4096
  TEXT r9, r24, r1, "HELLO"
  LDI r9, 0xD442F4
  LDI r8, 256
  LDI r0, 128
  TEXT r9, r8, r0, "HELLO"
  MOD r14, r17, r6
  LDI r3, 0x46B14A
  LDI r15, 0x1515D0
  LDI r6, 0x3D8C0B
  PSETI
  FRAME
  JMP main_0
