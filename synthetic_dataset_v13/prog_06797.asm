; DESCRIPTION: Places a orange 94x105 rectangle at position (154, 83).
; PLAN: r0=154(x), r1=83(y), r2=94(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 83
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
