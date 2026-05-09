; DESCRIPTION: Renders a cyan box of size 24x40 starting at (48, 38).
; PLAN: r0=48(x), r1=38(y), r2=24(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 38
LDI r2, 24
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
