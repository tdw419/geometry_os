; DESCRIPTION: Renders a white box of size 99x86 starting at (143, 104).
; PLAN: r0=143(x), r1=104(y), r2=99(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 104
LDI r2, 99
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
