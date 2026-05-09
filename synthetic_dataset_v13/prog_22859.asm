; DESCRIPTION: Composite: Places a orange dot at position (37, 168) then Draws a cyan line from (420, 152) to (224, 212).
; PLAN: r0=37(x), r1=168(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=420(x1), r6=152(y1), r7=224(x2), r8=212(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 168
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 420
LDI r6, 152
LDI r7, 224
LDI r8, 212
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
