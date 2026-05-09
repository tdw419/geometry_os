; DESCRIPTION: Renders a cyan box of size 103x11 starting at (200, 1).
; PLAN: r0=200(x), r1=1(y), r2=103(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 1
LDI r2, 103
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
