; DESCRIPTION: Renders a cyan box of size 117x64 starting at (287, 39).
; PLAN: r0=287(x), r1=39(y), r2=117(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 39
LDI r2, 117
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
