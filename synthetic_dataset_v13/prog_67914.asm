; DESCRIPTION: Places a orange 112x86 rectangle at position (63, 141).
; PLAN: r0=63(x), r1=141(y), r2=112(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 141
LDI r2, 112
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
