; DESCRIPTION: Renders a cyan box of size 50x22 starting at (146, 62).
; PLAN: r0=146(x), r1=62(y), r2=50(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 62
LDI r2, 50
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
