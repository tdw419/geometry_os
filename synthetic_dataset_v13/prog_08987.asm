; DESCRIPTION: Places a orange 46x16 rectangle at position (42, 112).
; PLAN: r0=42(x), r1=112(y), r2=46(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 112
LDI r2, 46
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
