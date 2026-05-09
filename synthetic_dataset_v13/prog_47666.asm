; DESCRIPTION: Places a orange 76x55 rectangle at position (242, 148).
; PLAN: r0=242(x), r1=148(y), r2=76(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 148
LDI r2, 76
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
