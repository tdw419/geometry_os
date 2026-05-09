; DESCRIPTION: Renders a green box of size 83x82 starting at (308, 166).
; PLAN: r0=308(x), r1=166(y), r2=83(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 166
LDI r2, 83
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
