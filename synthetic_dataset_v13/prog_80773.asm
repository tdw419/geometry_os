; DESCRIPTION: Places a orange 48x36 rectangle at position (281, 130).
; PLAN: r0=281(x), r1=130(y), r2=48(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 130
LDI r2, 48
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
