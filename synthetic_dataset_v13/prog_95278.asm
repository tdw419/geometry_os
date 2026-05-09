; DESCRIPTION: Renders a green box of size 39x71 starting at (146, 103).
; PLAN: r0=146(x), r1=103(y), r2=39(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 103
LDI r2, 39
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
