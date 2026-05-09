; DESCRIPTION: Places a yellow 68x62 rectangle at position (374, 108).
; PLAN: r0=374(x), r1=108(y), r2=68(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 108
LDI r2, 68
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
