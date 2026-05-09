; DESCRIPTION: Renders a white box of size 104x42 starting at (266, 8).
; PLAN: r0=266(x), r1=8(y), r2=104(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 8
LDI r2, 104
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
