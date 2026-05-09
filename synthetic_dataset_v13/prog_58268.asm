; DESCRIPTION: Places a orange 22x56 rectangle at position (50, 192).
; PLAN: r0=50(x), r1=192(y), r2=22(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 192
LDI r2, 22
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
