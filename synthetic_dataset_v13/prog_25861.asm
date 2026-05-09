; DESCRIPTION: Renders a cyan box of size 49x25 starting at (135, 31).
; PLAN: r0=135(x), r1=31(y), r2=49(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 31
LDI r2, 49
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
