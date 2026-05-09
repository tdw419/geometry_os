; DESCRIPTION: Places a cyan circle of radius 59 at center (295, 146).
; PLAN: r0=295(x), r1=146(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 146
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
