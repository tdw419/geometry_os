; DESCRIPTION: Renders a cyan box of size 111x10 starting at (38, 193).
; PLAN: r0=38(x), r1=193(y), r2=111(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 193
LDI r2, 111
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
