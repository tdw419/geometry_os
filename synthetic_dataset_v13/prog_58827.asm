; DESCRIPTION: Places a black 96x55 rectangle at position (294, 16).
; PLAN: r0=294(x), r1=16(y), r2=96(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 16
LDI r2, 96
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
