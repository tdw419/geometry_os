; DESCRIPTION: Renders a cyan box of size 29x39 starting at (243, 178).
; PLAN: r0=243(x), r1=178(y), r2=29(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 178
LDI r2, 29
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
