; DESCRIPTION: Places a orange 42x91 rectangle at position (71, 7).
; PLAN: r0=71(x), r1=7(y), r2=42(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 7
LDI r2, 42
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
