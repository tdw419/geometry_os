; DESCRIPTION: Renders a white box of size 12x66 starting at (255, 146).
; PLAN: r0=255(x), r1=146(y), r2=12(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 146
LDI r2, 12
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
