; drawing loop program
; initialization
  LDI r0, 926
  LDI r14, 0x998EC5
  LDI r3, 0xCCD244
main_0:
  LDI r9, 16
  LDI r11, 0xEBA2B9
  LDI r0, 32
  TEXT r9, r11, r0, "HELLO"
  AND r8, r7, r2
  AND r6, r15, r1
  OR r2, r1, r6
  FRAME
  JMP main_0
