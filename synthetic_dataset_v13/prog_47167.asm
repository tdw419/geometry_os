; DESCRIPTION: Renders a white box of size 54x64 starting at (303, 83).
; PLAN: r0=303(x), r1=83(y), r2=54(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 83
LDI r2, 54
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
