; DESCRIPTION: Renders a cyan box of size 16x21 starting at (153, 223).
; PLAN: r0=153(x), r1=223(y), r2=16(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 223
LDI r2, 16
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
