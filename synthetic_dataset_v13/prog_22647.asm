; DESCRIPTION: Renders a cyan box of size 111x84 starting at (207, 146).
; PLAN: r0=207(x), r1=146(y), r2=111(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 146
LDI r2, 111
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
