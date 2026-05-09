; DESCRIPTION: Renders a white box of size 21x16 starting at (464, 229).
; PLAN: r0=464(x), r1=229(y), r2=21(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 229
LDI r2, 21
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
