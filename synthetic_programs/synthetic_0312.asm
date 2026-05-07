; Synthetic GeOS Program
; initialization
LDI r15, 0xFF0000
LDI r17, 0xFFFF00
; arithmetic section
SUB r30, r17, r24
LDI r27, 0xFF00FF
ADD r14, r8, r15
LDI r24, 294
  HALT