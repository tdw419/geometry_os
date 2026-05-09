; DESCRIPTION: Places a cyan 55x62 rectangle at position (288, 184).
; PLAN: r0=288(x), r1=184(y), r2=55(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 184
LDI r2, 55
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
