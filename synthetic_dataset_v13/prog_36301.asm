; DESCRIPTION: Renders a green box of size 92x16 starting at (276, 37).
; PLAN: r0=276(x), r1=37(y), r2=92(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 37
LDI r2, 92
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
