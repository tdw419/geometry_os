; input driven program
; initialization
  LDI r4, 2643
  LDI r3, 0x036806
  LDI r19, 0x6520E6
main_0:
  LDI r14, 905
  LDI r8, 1483
  LDI r11, 1940
  PSETI
  LDI r12, 0x6D3773
  LDI r3, 1
  LDI r3, 888
  WPIXEL
  MOD r0, r6, r9
  LDI r24, 2454
  LDI r15, 0x993E64
  LDI r8, 0xC7853B
  TEXT r24, r15, r8, "HELLO"
  SAR r0, r8, r5
  SHL r0, r8, r9
  FRAME
  JMP main_0
