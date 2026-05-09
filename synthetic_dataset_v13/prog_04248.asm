; DESCRIPTION: Places a cyan 55x55 rectangle at position (5, 173).
; PLAN: r0=5(x), r1=173(y), r2=55(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 173
LDI r2, 55
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
