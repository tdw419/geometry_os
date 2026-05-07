; input driven program
; initialization
  LDI r12, 0x2AB9D7
  LDI r7, 256
  LDI r10, 0xC5D584
  LDI r23, 1944
  LDI r0, 2401
  LDI r18, 128
  LDI r8, 0xBB582C
main_0:
  LDI r6, 16
  LDI r17, 0x30370D
  LDI r5, 0x4D080B
  DRAWTEXT r6, r17, r5, "WORLD"
  LDI r19, 2
  LDI r3, 255
  LDI r13, 4058
  LDI r5, 16
  LDI r3, 0x352AB9
  RECTF r19, r3, r13, r5, r3
  OR r1, r0, r11
  OR r10, r12, r5
  LDI r5, 0xEDD2F6
  LDI r1, 0xA08298
  LDI r5, 0x5B1D41
  DRAWTEXT r5, r1, r5, "WORLD"
  FRAME
  JMP main_0
