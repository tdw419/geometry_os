; DESCRIPTION: Renders a cyan box of size 113x45 starting at (160, 8).
; PLAN: r0=160(x), r1=8(y), r2=113(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 8
LDI r2, 113
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
