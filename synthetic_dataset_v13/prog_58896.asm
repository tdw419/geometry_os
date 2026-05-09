; DESCRIPTION: Places a yellow 37x91 rectangle at position (358, 50).
; PLAN: r0=358(x), r1=50(y), r2=37(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 50
LDI r2, 37
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
