; DESCRIPTION: Places a cyan 55x54 rectangle at position (279, 69).
; PLAN: r0=279(x), r1=69(y), r2=55(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 69
LDI r2, 55
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
