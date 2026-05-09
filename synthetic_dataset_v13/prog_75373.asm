; DESCRIPTION: Renders a white box of size 95x109 starting at (294, 94).
; PLAN: r0=294(x), r1=94(y), r2=95(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 94
LDI r2, 95
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
