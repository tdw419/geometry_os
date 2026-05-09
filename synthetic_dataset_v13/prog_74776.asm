; DESCRIPTION: Places a yellow 36x91 rectangle at position (439, 69).
; PLAN: r0=439(x), r1=69(y), r2=36(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 69
LDI r2, 36
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
